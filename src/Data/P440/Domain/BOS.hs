{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.BOS where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.10 Справка об остатках денежных средств на счете

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
    ,датаСправ    :: Date
    ,номЗР        :: Text
    ,датаПодпЗР   :: Date
    ,наимПодтв    :: Maybe Text
    ,призНал      :: Maybe Text
    ,датаПодп     :: Date
    ,свНО         :: СвНО
    ,свБанкИлиУБР :: СвБанкИлиСвУБР
    ,плЮЛИлиПлФЛ  :: ПлЮЛИлиПлФЛ
    ,остСчет      :: [ОстСч]
    ,остЭДС       :: [ОстЭДС]
    ,остВклад     :: [ОстВклад]
    ,отсутствуют  :: [Отсутствуют]
    ,предБанка    :: ПредБ
} deriving (Eq, Show, Typeable)

data ПлЮЛИлиПлФЛ = ПлЮЛ' ПлЮЛ
                 | ПлФЛ' ПлФЛ
                 deriving (Eq, Show, Typeable)

data ОстСч = ОстСч {
     номСч      :: НомСч
    ,видСч      :: Text
    ,датаОткрСч :: Date
    ,датаЗакрСч :: Maybe Date
    ,кодВалСч   :: Text
    ,отстатокСч :: Text
} deriving (Eq, Show, Typeable)

data ОстВклад = ОстВклад {
     номВкл        :: Text
    ,видВкл        :: Text
    ,кодВалВклад   :: Text
    ,датаОткрВклад :: Date
    ,датаИстВклад  :: Maybe Date
    ,датаЗакрВклад :: Maybe Date
    ,суммаВкл      :: Text
    ,проценты      :: Text
    ,остатокВклад  :: Text
} deriving (Eq, Show, Typeable)

data ОстЭДС = ОстЭДС {
     идЭСП       :: Text
    ,датаЗакрЭДС :: Maybe Text
    ,кодВалЭДС   :: Text
    ,остатокЭДС  :: Text
} deriving (Eq, Show, Typeable)

data Отсутствуют = Отсутствуют {
    номер :: Text
} deriving (Eq, Show, Typeable)
