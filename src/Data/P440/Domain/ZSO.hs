{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.ZSO where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.4 Запрос НО об остатках

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,запросОст :: ЗапросОст
} deriving (Eq, Show, Typeable)

data ЗапросОст = ЗапросОст {
     номЗапр      :: Text
    ,стНКРФ       :: Text
    ,видЗапр      :: Text
    ,основЗапр    :: Text
    ,типЗапр      :: Text
    ,признЗапр    :: Maybe Text
    ,датаПоСост   :: Date
    ,датаПодп     :: Date
    ,свНО         :: СвНО
    ,свПл         :: СвПл
    ,банкИлиУБР   :: СвБанкИлиСвУБР
    ,счетИлиКЭСП  :: СчетИлиКЭСП
    ,руководитель :: РукНО
} deriving (Eq, Show, Typeable)

data СчетИлиКЭСП = Счет [НомСч]
                 | КЭСП [Text]
                 deriving (Eq, Show, Typeable)
