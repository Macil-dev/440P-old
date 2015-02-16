{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.ZSN where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.5 Запрос НО о наличии счетов

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,запросНал :: ЗапросНал
} deriving (Eq, Show, Typeable)

data ЗапросНал = ЗапросНал {
     номЗапр      :: Text
    ,стНКРФ       :: Text
    ,видЗапр      :: Text
    ,основЗапр    :: Text
    ,признЗапр    :: Text
    ,датаПодп     :: Date
    ,наДатуИлиЗаПериод :: НаДатуИлиЗаПериод
    ,свНО         :: СвНО
    ,свПл         :: СвПл
    ,банкИлиУБР   :: СвБанкИлиСвУБР
    ,руководитель :: РукНО
} deriving (Eq, Show, Typeable)
