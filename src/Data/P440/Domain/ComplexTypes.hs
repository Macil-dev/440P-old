{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.ComplexTypes where

import Data.P440.Domain.SimpleTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- Сложные типы из раздела 2.15

-- Сведения о банке (филиале) БанкТип
data Банк = Банк {
     регНом   :: Text    -- Номер по КГРКО
    ,номФил   :: Text    -- Филиал по КГРКО
    ,бикБанк  :: БИК     -- БИК по БИК
    ,наимБанк :: Text    -- Наименование по БИК
    ,иннБанк  :: ИННЮЛ   -- ИНН банка
    ,кппБанк  :: КПП     -- КПП банка
} deriving (Eq, Show, Typeable)

-- Сведения об учреждении Банка России УБРТип
data УБР = УБР {
     бикУБР  :: БИК      -- БИК УБР по БИК
    ,наимУБР :: Text     -- Наименование по БИК
    ,иннбр   :: Text     -- ИНН Банка России. Константа 7702235133.
    ,кппубр  :: КПП      -- КПП УБР
} deriving (Eq, Show, Typeable)

-- Сведения о налоговом органе СвНОТип
data СвНО = СвНО {
     кодНО  :: ИФНС      -- Код по СОУН
    ,наимНО :: Text      -- Наименование по СОУН
} deriving (Eq, Show, Typeable)

-- Руководитель (заместитель) НО РукНОТип
data РукНО = РукНО {
     классЧин :: Maybe Text -- Классный чин
    ,фиоРукНО :: ФИО        -- ФИО
} deriving (Eq, Show, Typeable)

-- Представитель КО/УБР
data ПредБ = ПредБ {
     должностьПредБ :: Text -- Должность
    ,фиоПредБ       :: ФИО  -- ФИО
} deriving (Eq, Show, Typeable)

-- Плательщик - организация ПлЮЛТип
data ПлЮЛ = ПлЮЛ {
     иннЮЛ  :: ИННЮЛ        -- ИНН
    ,кппЮЛ  :: КПП          -- КПП
    ,наимЮЛ :: Text         -- Наименование
} deriving (Eq, Show, Typeable)

-- Плательщик - ИП/Физ. лицо/Нотариус/Адвокат ПлФЛ
data ПлФЛ = ПлФЛ {
     иннФЛ :: ИННФЛ         -- ИНН
    ,фиоФЛ :: ФИО           -- ФИО
} deriving (Eq, Show, Typeable)

-- ФИО ФИОТип
data ФИО = ФИО {
     фамилия  :: Text       -- Фамилия
    ,имя      :: Text       -- Имя
    ,отчество :: Maybe Text -- Отчество
} deriving (Eq, Show, Typeable)

-- Адрес в Российской Федерации АдрРФТип
data АдрРФ = АдрРФ {
     индекс     :: Text
    ,кодРегион  :: Text
    ,район      :: Maybe Text
    ,город      :: Maybe Text
    ,населПункт :: Maybe Text
    ,улица      :: Maybe Text
    ,дом        :: Maybe Text
    ,корпус     :: Maybe Text
    ,кварт      :: Maybe Text
} deriving (Eq, Show, Typeable)
