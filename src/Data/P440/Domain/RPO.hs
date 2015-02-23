{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.RPO where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.1 Решение о приостановлении

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,решПриост :: РешПриост
} deriving (Eq, Show, Typeable)

data РешПриост = РешПриост {
     номРешПр :: Text
    ,датаПодп :: Date
    ,кодОснов :: Text
    ,обстоят  :: Text
    ,бик      :: БИК
    ,наимБ    :: Text
    ,номФ     :: Text
    ,сумВзыск :: Maybe Text
    ,номРешВзыск  :: Maybe Text
    ,датаРешВзыск :: Maybe Date
    ,свНО     :: СвНО
    ,свПл     :: СвПл
    ,счет     :: [Счет]
    ,кэсп     :: [КЭСП]
    ,руководитель :: РукНО
} deriving (Eq, Show, Typeable)

data СвПл = СвПл {
     плательщик :: ПлЮЛИлиПлИП
    ,адрПлат    :: АдрРФ
} deriving (Eq, Show, Typeable)

data ПлЮЛИлиПлИП = ПлЮЛ' ПлЮЛ
                 | ПлИП' ПлФЛ
                 deriving (Eq, Show, Typeable)

data Счет = Счет {
     номСч :: Text
    ,видСч :: Text
} deriving (Eq, Show, Typeable)

data КЭСП = КЭСП {
     идКЭСП :: Text
    ,валКЭСП :: Text
} deriving (Eq, Show, Typeable)
