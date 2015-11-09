{-|
  Module:      Network.Ricochet.Protocol.Protobuf
  Description: Helper lenses for dealing with Protobuf messages

"Network.Ricochet.Protocol.Protobuf" defines lenses that enable you to interact
with 'Text.ProtocolBuffers' messages.  It’s not specific to this library.
-}

{-# LANGUAGE RankNTypes #-}
module Network.Ricochet.Protocol.Protobuf
  ( ext
  , msg
  , utf8'
  ) where

import           Control.Lens
import           Control.Monad
import           Data.ByteString          (ByteString)
import           Data.Text                (Text)
import           Data.Text.Encoding       (decodeUtf8', encodeUtf8)
import           Text.ProtocolBuffers

-- | Take an extension key and return a Traversal' that yields all the values to
--   that extension key
ext :: (MonadPlus c, ExtKey c) => Key c msg v -> Traversal' msg (c v)
ext k = lens (^? to (getExt k) . _Right) (flip $ putExt k . maybe mzero id) . _Just

-- | A Prism' that can dump and parse Protobuf messages
msg :: (ReflectDescriptor msg, Wire msg) => Prism' ByteString msg
msg = lazy . prism' messagePut (^? to messageGet . _Right . _1)

-- | A Prism that can encode and decode 'Utf8' from and to 'Text'.
utf8' :: Prism' Utf8 Text
utf8' = iso utf8 Utf8 . strict . prism' encodeUtf8 (^? to decodeUtf8' . _Right)
