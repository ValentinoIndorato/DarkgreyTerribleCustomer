-- Ejercicio 16 tipos
f :: Int -> Int
f x = 5 * x

duplica :: (Num a) => a -> a -- pq no Num -> Num -> Num
duplica a = a + a

por2 :: Int -> Int -- Num a => a -> a si deja | Num -> Num No deja
por2 y = 2 * y

multiplicar :: Int -> Int -> Int
multiplicar zz tt = zz * tt

-- Qué diferencia hay entre las maneras de declarar la línea 4 y la 8, ¿cómo me doy cuenta cuales son los argumentos?.
promedio :: Float -> Float -> Float --  Fractional a => a -> a -> a
promedio x y = (x + y) / 2

-- Ejercicio 17 dar tipos
-- a
g :: Int -> Int
g y = 8 * y

-- b
h :: Int -> Int -> Int
h w z = z + w

-- c
j :: Int -> Bool
j x = x <= 0

-------------------------------------------
-- Ejercicio 18
-- Defin´ı las funciones que describimos a continuaci´on, luego implementalas en haskell . Por ejemplo: Enunciado: signo : Int → Int, que dado un entero retorna su signo, de la siguiente forma: retorna 1 si x es positivo, -1 si es negativo y 0 en cualquier otro caso.
sgn :: Int -> Int
sgn x
  | x > 0 = 1
  | x < 0 = -1
  | x == 0 = 0

-- \| otherwise = 0
-- a
entre0y9 :: Int -> Bool
entre0y9 x = (x >= 0) && (x <= 9)

-- b
rangoPrecio :: Int -> String
rangoPrecio x
  | x < 0 = "esto no puede ser"
  | x <= 2000 = "muy barato"
  | x >= 5000 = "muy caro"
  | x > 2000 && x < 5000 = "hay que verlo bien"




--Practico 2 
-- Ejercio 3 
--Una función de filter es aquella que dada una lista devuelve otra lista cuyos elementos son los elementos de la primera que cumplan una determinada condición, en el mismo orden y con las mismas repeticiones (si las hubiere). Por ejemplo: soloPares :: [Int] -> [Int] devuelve aquellos elementos de la lista que son pares.

-- a) soloPares [3,0,-2,12] = [0,-2, 12]
esPar :: Int -> Int
esPar x | (mod x 2 )== 0  = x
 | (mod x 2 )/= 0  = 0

          
soloPares :: [Int] -> [Int]
soloPares []=[]
soloPares (x : xs) = mod x 2 : soloPares (xs)

soloParesBis :: [Int] -> [Int]
soloParesBis []=[]
soloParesBis (x : xs) = esPar x : soloParesBis (xs)

esParBis :: Int -> Int
esParBis x = mod x 2 --si es impar devuelve 1

soloParesBis1 :: [Int] -> [Int]
soloParesBis1 []=[]
--soloParesBis1 (x : xs) = (((esParBis x) == 0)= x  ): soloParesBis1 (xs)

-- b mayoresQue10 [3,0,-2, 12] = [12]
mayorQue10 :: Int -> Bool
mayorQue10 x = x > 10
mayoresQue10 :: [Int] -> [Bool]
mayoresQue10 []=[]
mayoresQue10 (x:xs) = (x>10) : (mayoresQue10 xs)
--mayoresQue10 (x:xs) = (x>10==true = x) : (mayoresQue10 xs)
--Line 77  Para que devuelva el valor de x
--mayorA :: Int -> Int -> Int   mayorA x y | x>y = x  |otherwise 

-- c  mayoresQue 2 [3,0,-2, 12] = [3,12]

--mayorQue :: Int -> [Int] ->[Int]
--mayorQue [] = []
--mayorQue y (x:xs) = x > y : (mayorQue xs)
--COMO DEBE SER mayorQue y (x:xs) = ((x > y)== true = x) : (mayorQue xs)


-- Ejercio 4
--Una función de map es aquella que dada una lista devuelve otra lista cuyos elementos son los que se obtienen de aplicar una función a cada elemento de la primera en el mismo orden y con las mismas repeticiones (si las hubiere). Por ejemplo: duplica :: [Int] -> [Int] devuelve cada elemento de la lista multiplicado por 2.

--a sumar1 [3,0,-2] = [4,1,-1]

sumar1 :: [Int] -> [Int]
sumar1[]=[]-- comodin para que no me tire error de [1,2,3,4,5,6*** Exception: app/Main.hs:85:1-30: Non-exhaustive patterns in function sumar1
sumar1 (x:xs) =x+1 : sumar1 xs --sin parentecis por redundancia 

--b duplica [3,0,-2] = [6,0,-4]

duplicaEnLista ::  [Int] -> [Int]
duplicaEnLista []=[]
duplicaEnLista (x:xs) = x * 2 : duplicaEnLista xs

--c multiplica 3 [3,0,-2] = [9,0,-6]
multiplicaEnLista :: Int -> [Int] -> [Int]
multiplicaEnLista n []=[] --amuleto
multiplicaEnLista n (x:xs) = x * n : multiplicaEnLista n xs


-- Ejercicio 5
-- Una función de fold es aquella que dada una lista devuelve un valor resultante de combinar los elementos de la lista. Por ejemplo: sum: [Int] -> Int devuelve la sumatoria de los elementos de la lista.

-- a todosMenores10 [1,3,9] = True

todosMenores10 :: [Int]-> [Bool]-- tiene que ser Bool  todosMenores10 :: [Int]-> Bool
todosMenores10 (x:xs) = (x<10) : todosMenores10 xs
--todosMenores10bis :: [Int]-> Bool
--todosMenores10bis (x:xs) | (x<10) : todosMenores10bis xs = true

--b hay0 [1,0,3] = True
--hay0 :: [Int] -> Bool
--hay0 (x:xs)= x==0 hay0 xs

--c suma [1,2,3] = 6
suma :: [Int]-> Int
suma []=0
suma (x:xs)= x + suma xs

--Ejercicio 6 función de tipo zip
--Ej: repartir ["Juan", "Maria"] ["1 de Copa", "3 de Oro", "7 de Espada", "2 de Basto"] = [("Juan","1 de Copa"), ("Maria","3 de Oro")]

repartir :: [String] -> [String] -> [(String,String)] 
repartir [] (y:ys) = []
repartir (y:ys) [] = []
repartir [] [] = []
--repartir [] (y:ys) || (x:xs) [] = [] PQ no toma el or???
repartir (x:xs) (y:ys) = (x,y) :repartir xs ys
--COMO HAGO PARA QUE SEA FUNCION POR PARTES
-- xs==[] || ys == [] = [("","")]

--Ejercicio 7 función de tipo unzip
--Ej: apellidos [("Juan","Dominguez",22), ("Maria","Gutierrez",19), ("Damian","Perez",43)] = ["Dominguez","Gutierrez","Perez"]
apellidos :: [(String, String, Int)] -> [String]
apellidos []=[]
apellidos ((x,y,z):xs) = y: apellidos xs

--EJRECICIO 9 
--(i) Definí funciones por recursión para cada una de las siguientes descripciones. (ii) Evaluá los ejemplos manualmente (iii) Identificá si las funciones son de algún tipo ya conocido (fillter, map, fold). (iv)Programálas en haskell y verificá los resultados obtenidos.


--b  sumaPares [(1,2),(7,8),(11,0)] = 29

sumaPares :: [(Int,Int)]-> Int
sumaPares ((x,y):xs) = x + y + sumaPares xs
sumaPares []=0

--d quitar0s [2,0,3,4] = [2,3,4]
quitar0s :: [Int]->[Int]
quitar0s  []=[]
quitar0s (x:xs) | x/= 0 =x: quitar0s xs
 | x==0 = quitar0s xs
 --entiendo que esto serian dos formas de tener funciones por partes ya que al definir quitar0s  []=[] seria una parte que no va a pasar si (x:xs) 
--PREGUNTAR AL PROFE COMO HACERLA CON GUARDAS

--e
-- respuesta en pestaña AI de 9-e
ultimo :: Eq a => [a] -> a
ultimo (x:xs)
   | xs == [] = x
   | xs /= [] = ultimo xs
-- ultimo :: [a] -> a
-- ultimo (x:xs)
--   |xs == [] = x
--  |xs /= [] = ultimo xs
  
ultimoInt :: [Int] -> Int
ultimoInt (x:xs)
  |xs == [] = x
  |xs /= [] = ultimoInt xs

ultimoBis:: [a] -> a
--ultimoBis (x:xs) = xs !! (length (x:xs) - 1) Lo que marca esta bueno
ultimoBis (x:xs) = (x:xs) !! (length (x:xs) - 1) --creo que con la lista sola es suficiente


--f repetir 3 6 = [6,6,6]
repetir :: Int -> Int -> [Int]
repetir n k | n-1>= 0 = k :repetir (n-1) k
 | otherwise = []
--repetir n k | n>= 0 = k :repetir (n-1) k (esta fue la primer idea pero me devolvia [6,6,6,6] pq contaba el 3 y 1)

--g  concatenar [[1,4],[],[2]] = [1,4,2] 
-- ayuda de AI
concatenar :: [[a]] -> [a] 
concatenar [] = []
concatenar ([]:xs)=concatenar xs
concatenar ((y:ys):xs)  = y : concatenar (ys:xs)

--PORQUE "XS" YA ES UNA LISTA DE LISTAS?

--h rev [1,2,3] = [3,2,1]
rev :: [a]-> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]


hacerA :: String -> String

hacerA []=[]
hacerA (x:xs) | '¡' == x ||'e' == x  ||'i' == x ||'o' == x  ||'u' == x = 'a':hacerA xs
 |otherwise = x:hacerA xs

 --ghci> hacerA "¡Pero, che!"
--"\161Para, cha!"

-- profe ejemplos
apareaP :: [Int] -> [(Int, Int)]
apareaP [x,y] = [(x,y)]
apareaP (x:xs) = (x,head xs): apareaP xs
apareaP (x:y:xs)= (x,y):apareaP (y:xs)

-- mios
aparea :: [Int] -> [(Int, Int)]
aparea (x:y:ys) | ys == []= [(x,y)]
 |ys/= []= (x,y): aparea (y:ys)

empiezaConA :: [String]->[String]
empiezaConA [] = []
empiezaConA (xs:xss) |head xs == 'A' = xs: empiezaConA xss
  | head xs /= 'A' = empiezaConA xss
  |  xs == [] = empiezaConA xss
 