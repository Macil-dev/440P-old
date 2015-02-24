{-#LANGUAGE RankNTypes#-}
module Data.P440.XML.Parser where

import Text.XML.Stream.Parse

import Control.Monad.Catch

import Data.Text (Text)

import Data.Conduit

import Data.XML.Types (Name, Event)

type Parser a = (MonadThrow m) => Consumer Event m (Maybe a)

parseText' :: (MonadThrow m) => ParseSettings -> Conduit Text m Event
parseText' = mapOutput snd . parseText

runParser :: (MonadThrow m) => Parser a -> Text -> m (Maybe a)
runParser p t =
    yield t $$ parseText' def =$= p

simple :: Name -> Parser Text
simple name =
    tagNoAttr name content

complex_ :: Name -> AttrParser a -> Parser a
complex_ name p = tagName name p return

complex :: (MonadThrow m) => Name -> AttrParser a -> (a -> ConduitM Event o m b) -> ConduitM Event o m (Maybe b)
complex = tagName

attribute :: Name -> AttrParser Text
attribute = requireAttr

attributeMaybe :: Name -> AttrParser (Maybe Text)
attributeMaybe = optionalAttr
