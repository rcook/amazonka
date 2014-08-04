{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.StorageGateway.V2013_06_30.DeleteVolume
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This operation delete the specified gateway volume that you previously
-- created using the CreateStorediSCSIVolume API. For gateway-stored volumes,
-- the local disk that was configured as the storage volume is not deleted.
-- You can reuse the local disk to create another storage volume. Before you
-- delete a gateway volume, make sure there are no iSCSI connections to the
-- volume you are deleting. You should also make sure there is no snapshot in
-- progress. You can use the Amazon Elastic Compute Cloud (Amazon EC2) API to
-- query snapshots on the volume you are deleting and check the snapshot
-- status. For more information, go to DescribeSnapshots in the Amazon Elastic
-- Compute Cloud API Reference. In the request, you must provide the Amazon
-- Resource Name (ARN) of the storage volume you want to delete. Example
-- Request The following example shows a request that deletes a volume. POST /
-- HTTP/1.1 Host: storagegateway.us-east-1.amazonaws.com x-amz-Date:
-- 20120425T120000Z Authorization:
-- CSOC7TJPLR0OOKIRLGOHVAICUFVV4KQNSO5AEMVJF66Q9ASUAAJG Content-type:
-- application/x-amz-json-1.1 x-amz-target:
-- StorageGateway_20120630.DeleteVolume { "VolumeARN":
-- "arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway/volume/vol-1122AABB"
-- } HTTP/1.1 200 OK x-amzn-RequestId:
-- CSOC7TJPLR0OOKIRLGOHVAICUFVV4KQNSO5AEMVJF66Q9ASUAAJG Date: Wed, 25 Apr 2012
-- 12:00:02 GMT Content-type: application/x-amz-json-1.1 Content-length: 99 {
-- "VolumeARN":
-- "arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway/volume/vol-1122AABB"
-- }.
module Network.AWS.StorageGateway.V2013_06_30.DeleteVolume where

import Control.Lens
import Network.AWS.Request.JSON
import Network.AWS.StorageGateway.V2013_06_30.Types
import Network.AWS.Prelude

data DeleteVolume = DeleteVolume
    { _dviVolumeARN :: Text
      -- ^ The Amazon Resource Name (ARN) of the volume. Use the ListVolumes
      -- operation to return a list of gateway volumes.
    } deriving (Generic)

makeLenses ''DeleteVolume

instance ToPath DeleteVolume

instance ToQuery DeleteVolume

instance ToHeaders DeleteVolume

instance ToJSON DeleteVolume

data DeleteVolumeResponse = DeleteVolumeResponse
    { _dvoVolumeARN :: Maybe Text
      -- ^ The Amazon Resource Name (ARN) of the storage volume that was
      -- deleted. It is the same ARN you provided in the request.
    } deriving (Generic)

makeLenses ''DeleteVolumeResponse

instance FromJSON DeleteVolumeResponse

instance AWSRequest DeleteVolume where
    type Sv DeleteVolume = StorageGateway
    type Rs DeleteVolume = DeleteVolumeResponse

    request = get
    response _ = jsonResponse
