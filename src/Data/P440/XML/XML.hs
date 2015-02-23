{-#LANGUAGE GADTs#-}
module Data.P440.XML.XML where

import Prelude hiding (sequence)

import Data.Text (Text)

import qualified Data.Map.Lazy as M

import Text.XML

class ToNode a where
    toNode :: a -> Node

instance ToNode Node where
    toNode = id

class ToSequence a where
    toSequence :: a -> [Node]

data Sequence where
    Sequence :: ToSequence s => s -> Sequence

instance ToSequence Sequence where
    toSequence (Sequence s) = toSequence s

instance (ToNode a) => ToSequence [a] where
    toSequence = map toNode

instance (ToNode a) => ToSequence (Maybe a) where
    toSequence (Just a) = [toNode a]
    toSequence Nothing  = []

class Attribute a where
    toAttribute :: a -> Maybe Text

instance Attribute Text where
    toAttribute = Just

instance (Attribute a) => Attribute (Maybe a) where
    toAttribute (Just a) = toAttribute a
    toAttribute Nothing = Nothing

(=:) :: (Attribute a) => Name -> a -> (Name, Maybe Text)
name =: value = (name, toAttribute value)

attributes :: [(Name, Maybe Text)] -> M.Map Name Text
attributes =
    M.fromList . catMaybes'
    where
        catMaybes' ls = [(n, x) | (n, Just x) <- ls]

simple :: Name -> Text -> Node
simple name content =
    NodeElement $
        Element name M.empty [NodeContent content]

complex_ name attributes' =
    NodeElement $
        Element name (attributes attributes') []

complex :: Name -> [(Name, Maybe Text)] -> [Sequence] -> Node
complex name attributes' content =
    NodeElement $
        Element name (attributes attributes') (sequence content)

sequence :: [Sequence] -> [Node]
sequence = concatMap toSequence
