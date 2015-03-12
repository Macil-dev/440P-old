{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.BZ where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 3.6 Запрос на повторное получение квитанции

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,запросКвит :: ЗапросКвит
} deriving (Eq, Show, Typeable)

data ЗапросКвит = ЗапросКвит {
     имяФайла  :: Text
    ,датаПодп  :: Date
    ,свБанкИлиСвУБР :: СвБанкИлиСвУБР
    ,предБанка :: ПредБ
} deriving (Eq, Show, Typeable)
