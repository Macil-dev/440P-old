{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.SimpleTypes where

import Data.Typeable (Typeable)

import Data.Text (Text)

-- Простые типы из раздела 2.14

newtype ИФНС = ИФНС Text deriving (Eq, Show, Typeable)

newtype БИК = БИК Text deriving (Eq, Show, Typeable)

newtype ИННЮЛ = ИННЮЛ Text deriving (Eq, Show, Typeable)

newtype КПП = КПП Text deriving (Eq, Show, Typeable)

newtype ИННФЛ = ИННФЛ Text deriving (Eq, Show, Typeable)

newtype НомСч = НомСч Text deriving (Eq, Show, Typeable)

-- Дополнительные типы
-- TODO: Переопределить на более подходящие

newtype Date = Date Text deriving (Eq, Show, Typeable)

newtype Time = Time Text deriving (Eq, Show, Typeable)

newtype GUID = GUID Text deriving (Eq, Show, Typeable)
