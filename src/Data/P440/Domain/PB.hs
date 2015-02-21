{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.PB where

import Data.P440.Domain.SimpleTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 3.2 Подтверждение

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,подтверждение :: Подтверждение
} deriving (Eq, Show, Typeable)

data Подтверждение = Подтверждение {
     имяФайла          :: Text
    ,датаВремяПроверки :: DateTime
    ,результат         :: [Результат]
} deriving (Eq, Show, Typeable)

data Результат = Результат {
     кодРезПроверки :: Text
    ,пояснение      :: Maybe Text
    ,кодРекв        :: Maybe Text
    ,значРекв       :: Maybe Text
} deriving (Eq, Show, Typeable)
