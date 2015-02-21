{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.BNP where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.13 Исполнение о неисполнении/частичном испонении PNO

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,сообщНеисп :: СообщНеисп
} deriving (Eq, Show, Typeable)

data СообщНеисп = СообщНеисп {
     номСообщ  :: Text
    ,номПоруч  :: Text
    ,датаПоруч :: Date
    ,кодНОБ    :: ИФНС
    ,сумПлат   :: Text
    ,инннп     :: Text
    ,кппнп     :: Maybe КПП
    ,плательщ  :: Text
    ,кодИспол  :: Text
    ,сумЧаст   :: Maybe Text
    ,допСвед   :: Maybe Text
    ,датаПодп  :: Date
    ,номСчПлИлиИдКЭСП :: НомСчИлиИдКЭСП
    ,свБанкИлиСвУБР   :: СвБанкИлиСвУБР
    ,предБанка :: ПредБ
} deriving (Eq, Show, Typeable)

data НомСчИлиИдКЭСП = НомСчПл НомСч
                    | ИдКЭСП Text
                    deriving (Eq, Show, Typeable)

data СвБанкИлиСвУБР = СвБанк Банк
                    | СвУБР УБР
                    deriving (Eq, Show, Typeable)
