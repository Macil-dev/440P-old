{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.IZV where

import Data.P440.Domain.SimpleTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 3.1 Извещение

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,извещение :: Извещение
} deriving (Eq, Show, Typeable)

data Извещение = Извещение {
     имяФайла          :: Text
    ,кодРезПроверки    :: Text
    ,датаВремяПроверки :: DateTime
    ,датаВремяПериода  :: Maybe DateTime
} deriving (Eq, Show, Typeable)
