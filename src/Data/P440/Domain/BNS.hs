{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.BNS where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS (НаДатуИлиЗаПериод, СвБанкИлиСвУБР)

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.11 Справка о наличии счетов

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,справОстат :: СправОстат
} deriving (Eq, Show, Typeable)

data СправОстат = СправОстат {
     номСправ     :: Text
    ,номЗапр      :: Text
    ,датаПодпЗапр :: Date
    ,наимПодтв    :: Maybe Text
    ,призНал      :: Text
    ,датаПодп     :: Date
    ,наДатуИлиЗаПериод :: НаДатуИлиЗаПериод
    ,свНО         :: СвНО
    ,свБанкИлиУБР :: СвБанкИлиСвУБР
    ,свПл         :: СвПл
    ,свСчет       :: [СвСчет]
    ,свВклад      :: [СвВклад]
    ,предБанка    :: ПредБ
} deriving (Eq, Show, Typeable)

data СвПл = ПлЮЛ' ПлЮЛ
          | ПлИП' ПлФЛ
          deriving (Eq, Show, Typeable)

data СвСчет = СвСчет {
     номСч      :: Text
    ,видСч      :: Text
    ,датаОткрСч :: Date
    ,датаЗакрСч :: Maybe Date
    ,кодВалСч   :: Text
} deriving (Eq, Show, Typeable)

data СвВклад = СвВклад {
     номВкл      :: Text
    ,видВкл      :: Text
    ,кодВалВкл   :: Text
    ,датаОткрВкл :: Date
    ,датаИстВкл  :: Maybe Date
    ,датаЗакрВкл :: Maybe Date
    ,суммаВкл    :: Text
    ,проценты    :: Text
} deriving (Eq, Show, Typeable)
