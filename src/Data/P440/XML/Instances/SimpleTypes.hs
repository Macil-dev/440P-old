module Data.P440.XML.Instances.SimpleTypes where

import Data.P440.XML.XML

import Data.P440.Domain.SimpleTypes

-- Простые типы из раздела 2.14

instance Attribute ИФНС where
    toAttribute (ИФНС t) = toAttribute t

instance Attribute БИК where
    toAttribute (БИК t) = toAttribute t

instance Attribute ИННЮЛ where
    toAttribute (ИННЮЛ t) = toAttribute t

instance Attribute КПП where
    toAttribute (КПП t) = toAttribute t

instance Attribute ИННФЛ where
    toAttribute (ИННФЛ t) = toAttribute t

instance Attribute НомСч where
    toAttribute (НомСч t) = toAttribute t

-- Дополнительные типы

instance Attribute Date where
     toAttribute (Date t) = toAttribute t

instance Attribute Time where
     toAttribute (Time t) = toAttribute t

instance Attribute DateTime where
     toAttribute (DateTime t) = toAttribute t

instance Attribute GUID where
     toAttribute (GUID t) = toAttribute t
