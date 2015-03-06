{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.FilenameAst where

import Data.Typeable (Typeable)

import Data.Text

data MessageFilename =
    MessageFilename {messagePrefix   :: Text
                    ,messageResend   :: Text
                    ,messageTaxcode  :: Text
                    ,messageFiledate :: (Text, Text, Text)
                    ,messageNumber   :: Text
                    } deriving (Eq, Show, Typeable)

data ReplyFilename =
    ReplyFilename {replyPrefix   :: Text
                  ,replyResend   :: Text
                  ,replyMessage  :: MessageFilename
                  ,replyDivision :: Text
                  } deriving (Eq, Show, Typeable)

data AdditionalReplyFilename =
    AdditionalReplyFilename {areplyPrefix     :: Text
                            ,areplyResend     :: Text
                            ,areplyMessage    :: MessageFilename
                            ,areplyAccountNum :: Text
                            ,areylyFileNum    :: Text
                            } deriving (Eq, Show, Typeable)

data TransportAckFilename =
    TransportAckFilename {tackPrefix       :: Text
                         ,tackReceiver     :: Text
                         ,tackAckTransport :: TransportFilename
                         } deriving (Eq, Show, Typeable)

data TransportFilename =
    TransportFilename {transportPrefix   :: Text
                      ,transportSender   :: Text
                      ,transportReceiver :: Text
                      ,transportFiledate :: (Text, Text, Text)
                      } deriving (Eq, Show, Typeable)

data FNSAckFilename =
    FNSAckFilename {fackPrefix   :: Text
                   ,fackReceiver :: Text
                   ,fackReply    :: Text
                   } deriving (Eq, Show, Typeable)

data KOAck1Filename =
    KOAck1Filename {kack1Prefix  :: Text
                   ,kack1Message :: MessageFilename
                   } deriving (Eq, Show, Typeable)

data KOAck2Filename =
    KOAck2Filename {kack2Prefix   :: Text
                   ,kack2Message  :: MessageFilename
                   ,kack2Division :: Text
                   } deriving (Eq, Show, Typeable)
