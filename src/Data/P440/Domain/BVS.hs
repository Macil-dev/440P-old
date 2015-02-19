{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.BVS where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS (НаДатуИлиЗаПериод, СвБанкИлиСвУБР)

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.11 Выписка (основной файл)

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,выписка   :: Выписка
} deriving (Eq, Show, Typeable)

data Выписка = Выписка {
     видВыпис     :: Text
    ,номЗапр      :: Text
    ,датаПодпЗапр :: Date
    ,наимПодтв    :: Maybe Text
    ,признНал     :: Text
    ,колДопФ      :: Text
    ,датаПодп     :: Date
    ,наДатуИлиЗаПериод :: НаДатуИлиЗаПериод
    ,свНО         :: СвНО
    ,свБанкИлиСвУБР :: СвБанкИлиСвУБР
    ,свПл         :: СвПл
    ,свСчет       :: [СвСчет]
    ,свЭДС        :: [СвЭДС]
    ,свВклад      :: [СвВклад]
    ,предБанка    :: ПредБ
} deriving (Eq, Show, Typeable)

data СвПл = ПлЮЛ' ПлЮЛ
          | ПлФЛ' ПлФЛ
          deriving (Eq, Show, Typeable)

data СвСчет = СвСчет {
     порНомСчет    :: Text
    ,номСч         :: НомСч
    ,видСч         :: Text
    ,датаОткрСчет  :: Date
    ,датаЗакрСчет  :: Maybe Date
    ,кодВалСчет    :: Text
    ,датаНачСчет   :: Date
    ,датаКонСчет   :: Date
    ,остатНачСчет  :: Text
    ,суммаДебСчет  :: Text
    ,суммаКредСчет :: Text
    ,остатКонСчет  :: Text
} deriving (Eq, Show, Typeable)

data СвЭДС = СвЭДС {
     порНомЭДС    :: Text
    ,идЭСП        :: Text
    ,датаОткрЭДС  :: Date
    ,датаЗакрЭДС  :: Date
    ,кодВалЭДС    :: Text
    ,датаНачЭДС   :: Date
    ,датаКонЭДС   :: Date
    ,остатНачЭДС  :: Text
    ,суммаДебЭДС  :: Text
    ,суммаКредЭДС :: Text
    ,остатКонЭДС  :: Text
} deriving (Eq, Show, Typeable)

data СвВклад = СвВклад {
     порНомВклад    :: Text
    ,номВкл         :: Text
    ,видВкл         :: Text
    ,датаОткрВклад  :: Date
    ,датаИстВклад   :: Maybe Date
    ,датаЗакрВклад  :: Maybe Date
    ,кодВалВклад    :: Text
    ,датаНачВклад   :: Text
    ,датаКонВклад   :: Text
    ,остатНачВклад  :: Text
    ,суммаДебВклад  :: Text
    ,суммаКредВклад :: Text
    ,остатКонВклад  :: Text
    ,проценты       :: Text
} deriving (Eq, Show, Typeable)

data Отсутствуют = Отсутствуют {
    номер :: Text
} deriving (Eq, Show, Typeable)
