module Network.Ricochet.Version
  (Versions()) where

import           Network.Ricochet.Monad

import           Data.Map               (Map ())
import           GHC.Word               (Word8 ())
import           Network.Socket         (Socket ())

-- | Each version (Word8) has its own Handler that takes a Connection which has
-- completed version negotiation and does Ricochet actions
type Versions = Map Word8 (Connection -> Ricochet ())
