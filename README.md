# Практическое занятие по Z3/Haskell

**Ссылки**

* [Туториал по Z3](https://rise4fun.com/z3/tutorial)
* [Документация по пакету z3 в Haskell](https://hackage.haskell.org/package/z3-408.2/docs/Z3-Monad.html)


**Задание** 

* Установить Z3 локально и проверить его работоспособность: 
```
$ cat problem1.smt2 
(declare-const a Int)
(assert (> a 10))
(check-sat)
(get-model)
$ z3 problem1.smt2 
sat
(model 
  (define-fun a () Int
    11)
)
````

* Проверить работоспособность примера в Haskell:

```
cabal repl (ИЛИ stack ghci)
ghci> :main
Model: a -> 11

(Sat,Just 11)
```
или
```
stack ghci problems
ghci> :main
```

* Разобраться в соответствии интерфейса SMT2 и z3/Haskell
* Переписать произвольные примеры из туториала по Z3 в z3/Haskell
* Попытаться расширить примеры с использованием возможностей языка программирования 
(циклы, полиморфизм)