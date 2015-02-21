{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.KWT where

import Data.P440.Domain.SimpleTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 3.3 Квитанция

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,квитанция :: Квитанция
} deriving (Eq, Show, Typeable)

data Квитанция = Квитанция {
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
