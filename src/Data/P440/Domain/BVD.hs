{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.BVD where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.11 Выписка (дополнительный файл)

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,счет      :: Счет
} deriving (Eq, Show, Typeable)

data Счет = Счет {
     порНом     :: Text
    ,подНомДФ   :: Text
    ,номСчВклЭС :: Text
    ,операции   :: [Операции]
    ,реквДок    :: РеквДок
    ,реквБанка  :: РеквБанка
    ,реквПлат   :: РеквПлат
    ,суммаОпер  :: СуммаОпер
} deriving (Eq, Show, Typeable)

data Операции = Операции {
     идБлок    :: Text
    ,датаОпер  :: Text
    ,времяОпер :: Maybe Text
    ,назнПл    :: Maybe Text
    ,ипАддр    :: Maybe Text
    ,номТел    :: Maybe Text
    ,кодПерев  :: Maybe Text
} deriving (Eq, Show, Typeable)

data РеквДок = РеквДок {
     видДок  :: Maybe Text
    ,номДок  :: Text
    ,датаДок :: Date
} deriving (Eq, Show, Typeable)

data РеквБанка = РеквБанка {
     номКорСч :: Maybe Text
    ,наимБП   :: Text
    ,бикбп    :: Maybe БИК
    ,свифт    :: Maybe Text
} deriving (Eq, Show, Typeable)

data РеквПлат = РеквПлат {
     наимПП  :: Text
    ,иннпп   :: Maybe Text
    ,кпппп   :: Maybe Text
    ,номСчПП :: Text
} deriving (Eq, Show, Typeable)

data СуммаОпер = СуммаОпер {
     дебет  :: Text
    ,кредит :: Text
} deriving (Eq, Show, Typeable)
