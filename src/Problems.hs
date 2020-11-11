import Z3.Monad
import Debug.Trace
import Control.Monad
import Data.Maybe

{- SMT2:

(declare-const a Int)
(assert (> a 10))
(check-sat)
(get-model)

-}
problem1 :: Z3 (Result, Maybe Integer) -- значение a?
problem1 = do
  -- Готовим формулу
  a_name <- mkStringSymbol "a"
  a_sort <- mkIntSort
  a_const <- mkConst a_name a_sort
  lit10 <- mkInt 10 a_sort
  assert =<< mkGt a_const lit10
--  assert =<< mkLt a_const lit10 -- Unsat, если раскомментировать

  withModel $ \m -> do
    -- Изучаем модель
    m_str <- showModel m
    traceM ("Model: " ++ m_str)
    -- Извлекаем результат из модели
    fromJust <$> evalInt m a_const

main :: IO ()
main = do
  mbSol <- evalZ3 problem1
  print mbSol

