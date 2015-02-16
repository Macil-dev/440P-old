{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.APN where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.9 Решение НО о икасоовом

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,решение   :: Решение
} deriving (Eq, Show, Typeable)

data Решение = Решение {
     номРеш       :: Text
    ,датаПодп     :: Date
    ,видРеш       :: Text
    ,банкПл       :: Text
    ,бикбПл       :: БИК
    ,инннп        :: Text
    ,кппнп        :: Maybe КПП
    ,номОтмРеш    :: Maybe Text
    ,датаОтмРеш   :: Maybe Date
    ,приостПоруч  :: [ПриостПоруч]
    ,свНО         :: СвНО
    ,руководитель :: РукНО
} deriving (Eq, Show, Typeable)

data ПриостПоруч = ПриостПоруч {
     номПоруч  :: Text
    ,датаПоруч :: Date
    ,видСч     :: Maybe Text
    ,сумма     :: Maybe Text
    ,номСчПлИлиКЭСП :: Maybe Text
} deriving (Eq, Show, Typeable)

data НомСчПлИлиКЭСП = Счет НомСч
                    | КЭСП Text
                    deriving (Eq, Show, Typeable)
