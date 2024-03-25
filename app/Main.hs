-- Ejercicio 16 tipos
f :: Int -> Int 
f x = 5 * x
duplica :: Num a => a -> a -- pq no Num -> Num -> Num
duplica a = a + a
por2 :: Int -> Int -- Num a => a -> a si deja | Num -> Num No deja
por2 y =  2 * y
multiplicar :: Int -> Int -> Int
multiplicar zz tt = zz * tt 
-- Qué diferencia hay entre las maneras de declarar la línea 4 y la 8, ¿cómo me doy cuenta cuales son los argumentos?.
promedio :: Float -> Float -> Float --  Fractional a => a -> a -> a
promedio x y = (x+y) / 2

-- Ejercicio 17 dar tipos
--a
g :: Int -> Int 
g y = 8 * y 

-- b
h ::  Int -> Int -> Int
h w z = z + w

--c
j :: Int -> Bool
j x = x <= 0

-------------------------------------------
-- Ejercicio 18 
--Defin´ı las funciones que describimos a continuaci´on, luego implementalas en haskell . Por ejemplo: Enunciado: signo : Int → Int, que dado un entero retorna su signo, de la siguiente forma: retorna 1 si x es positivo, -1 si es negativo y 0 en cualquier otro caso.
sgn :: Int -> Int
sgn x | x>0 = 1
      | x<0 = -1
      | x==0 = 0 -- | otherwise = 0
--a
entre0y9 ::Int -> Bool
entre0y9 x = (x>=0) && (x<=9)

-- b 
rangoPrecio :: Int -> String
rangoPrecio x | x<0 = "esto no puede ser"
              | x<=2000 = "muy barato" 
              | x>=5000 =  "muy caro"
              | x>2000 && x<5000 = "hay que verlo bien"
              