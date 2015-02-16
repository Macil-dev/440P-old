{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.ROO where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.2 Решение об отмене приостановления

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,решОтмена :: РешОтмена
} deriving (Eq, Show, Typeable)

data РешОтмена = РешОтмена {
     номРешОт   :: Text
    ,датаПодп   :: Date
    ,видРеш     :: Text
    ,номРешВО   :: Maybe Text
    ,датаРешВО  :: Maybe Text
    ,номерРешПр :: Text
    ,датаРешПр  :: Date
    ,бик        :: БИК
    ,наимБ      :: Text
    ,номФ       :: Text
    ,свНО       :: СвНО
    ,свПл       :: СвПл
    ,счет       :: [Счет]
    ,кэсп       :: [КЭСП]
    ,руководитель :: РукНО
} deriving (Eq, Show, Typeable)

data СвПл = СвПл {
     плательщик :: ЮЛИлиИП
    ,адрПлат :: АдрРФ
} deriving (Eq, Show, Typeable)

data ЮЛИлиИП = ЮЛ ПлЮЛ
             | ИП ПлФЛ
             deriving (Eq, Show, Typeable)

data Счет = Счет {
     номСч :: Text
    ,видСч :: Text
} deriving (Eq, Show, Typeable)

data КЭСП = КЭСП {
     идКЭСП :: Text
    ,валКЭСП :: Text
} deriving (Eq, Show, Typeable)
