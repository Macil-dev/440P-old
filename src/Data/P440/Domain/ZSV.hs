{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.ZSV where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.6 Запрос выписки

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,запросВыпис :: ЗапросВыпис
} deriving (Eq, Show, Typeable)

data ЗапросВыпис = ЗапросВыпис {
     номЗапр      :: Text
    ,стНКРФ       :: Text
    ,видЗапр      :: Text
    ,основЗапр    :: Text
    ,типЗапр      :: Text
    ,признЗапр    :: Maybe Text
    ,датаПодп     :: Date
    ,свНО         :: СвНО
    ,свПл         :: СвПл
    ,банкИлиУБР   :: СвБанкИлиСвУБР
    ,поУказаннымИлиПоВсем  :: ПоУказаннмыИлиПоВсем
    ,руководитель :: РукНО
} deriving (Eq, Show, Typeable)

data ПоУказаннмыИлиПоВсем = ПоУказанным СчетИлиКЭСП
                          | ПоВсем НаДатуИлиЗаПериод
                          deriving (Eq, Show, Typeable)

data СчетИлиКЭСП = Счет' [Счет]
                 | КЭСП' [КЭСП]
                 deriving (Eq, Show, Typeable)

data Счет = Счет {
     номСч       :: НомСч
    ,датаНачСчет :: Date
    ,датаКонСчет :: Date
} deriving (Eq, Show, Typeable)

data КЭСП = КЭСП {
     идКЭСП      :: Text
    ,датаНачКЭСП :: Date
    ,датаКонКЭСП :: Date
} deriving (Eq, Show, Typeable)
