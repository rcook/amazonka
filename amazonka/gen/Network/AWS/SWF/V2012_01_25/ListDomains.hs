{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.SWF.V2012_01_25.ListDomains
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the list of domains registered in the account. The results may be
-- split into multiple pages. To retrieve subsequent pages, make the call
-- again using the nextPageToken returned by the initial call. This operation
-- is eventually consistent. The results are best effort and may not exactly
-- reflect recent updates and changes. Access Control You can use IAM policies
-- to control this action's access to Amazon SWF resources as follows: Use a
-- Resource element with the domain name to limit the action to only specified
-- domains. The element must be set to arn:aws:swf::AccountID:domain/*", where
-- “AccountID" is the account ID, with no dashes. Use an Action element to
-- allow or deny permission to call this action. You cannot use an IAM policy
-- to constrain this action's parameters. If the caller does not have
-- sufficient permissions to invoke the action, or the parameter values fall
-- outside the specified constraints, the action fails by throwing
-- OperationNotPermitted. For details and example IAM policies, see Using IAM
-- to Manage Access to Amazon SWF Workflows. ListDomains Example POST /
-- HTTP/1.1 Host: swf.us-east-1.amazonaws.com User-Agent: Mozilla/5.0
-- (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.25) Gecko/20111212
-- Firefox/3.6.25 ( .NET CLR 3.5.30729; .NET4.0E) Accept: application/json,
-- text/javascript, */* Accept-Language: en-us,en;q=0.5 Accept-Encoding:
-- gzip,deflate Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7 Keep-Alive: 115
-- Connection: keep-alive Content-Type: application/x-amz-json-1.0
-- X-Requested-With: XMLHttpRequest X-Amz-Date: Sun, 15 Jan 2012 03:09:58 GMT
-- X-Amz-Target: SimpleWorkflowService.ListDomains Content-Encoding: amz-1.0
-- X-Amzn-Authorization: AWS3
-- AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE,Algorithm=HmacSHA256,SignedHeaders=Host;X-Amz-Date;X-Amz-Target;Content-Encoding,Signature=ZCprC72dUxF9ca3w/tbwKZ8lBQn0jaA4xOJqDF0uqMI=
-- Referer: http://swf.us-east-1.amazonaws.com/explorer/index.html
-- Content-Length: 86 Pragma: no-cache Cache-Control: no-cache
-- {"registrationStatus": "REGISTERED", "maximumPageSize": 50, "reverseOrder":
-- false} HTTP/1.1 200 OK Content-Length: 568 Content-Type: application/json
-- x-amzn-RequestId: 67e874cc-3f26-11e1-9b11-7182192d0b57 {"domainInfos": [
-- {"description": "music", "name": "867530901", "status": "REGISTERED"},
-- {"description": "music", "name": "867530902", "status": "REGISTERED"},
-- {"description": "", "name": "Demo", "status": "REGISTERED"},
-- {"description": "", "name": "DemoDomain", "status": "REGISTERED"},
-- {"description": "", "name": "Samples", "status": "REGISTERED"},
-- {"description": "", "name": "testDomain2", "status": "REGISTERED"},
-- {"description": "", "name": "testDomain3", "status": "REGISTERED"},
-- {"description": "", "name": "testDomain4", "status": "REGISTERED"},
-- {"description": "", "name": "zsxfvgsxcv", "status": "REGISTERED"} ] }.
module Network.AWS.SWF.V2012_01_25.ListDomains where

import Control.Lens
import Network.AWS.Request.JSON
import Network.AWS.SWF.V2012_01_25.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'ListDomains' request.
listDomains :: RegistrationStatus -- ^ '_ldiRegistrationStatus'
            -> ListDomains
listDomains p1 = ListDomains
    { _ldiRegistrationStatus = p1
    , _ldiMaximumPageSize = Nothing
    , _ldiNextPageToken = Nothing
    , _ldiReverseOrder = Nothing
    }

data ListDomains = ListDomains
    { _ldiRegistrationStatus :: RegistrationStatus
      -- ^ Specifies the registration status of the domains to list.
    , _ldiMaximumPageSize :: Maybe Integer
      -- ^ The maximum number of results returned in each page. The default
      -- is 100, but the caller can override this value to a page size
      -- smaller than the default. You cannot specify a page size greater
      -- than 100. Note that the number of domains may be less than the
      -- maxiumum page size, in which case, the returned page will have
      -- fewer results than the maximumPageSize specified.
    , _ldiNextPageToken :: Maybe Text
      -- ^ If on a previous call to this method a NextPageToken was
      -- returned, the result has more than one page. To get the next page
      -- of results, repeat the call with the returned token and all other
      -- arguments unchanged.
    , _ldiReverseOrder :: Maybe Bool
      -- ^ When set to true, returns the results in reverse order. By
      -- default the results are returned in ascending alphabetical order
      -- of the name of the domains.
    } deriving (Generic)

makeLenses ''ListDomains

instance ToPath ListDomains

instance ToQuery ListDomains

instance ToHeaders ListDomains

instance ToJSON ListDomains

data ListDomainsResponse = ListDomainsResponse
    { _dddddsDomainInfos :: [DomainInfo]
      -- ^ A list of DomainInfo structures.
    , _dddddsNextPageToken :: Maybe Text
      -- ^ Returns a value if the results are paginated. To get the next
      -- page of results, repeat the request specifying this token and all
      -- other arguments unchanged.
    } deriving (Generic)

makeLenses ''ListDomainsResponse

instance FromJSON ListDomainsResponse

instance AWSRequest ListDomains where
    type Sv ListDomains = SWF
    type Rs ListDomains = ListDomainsResponse

    request = get
    response _ = jsonResponse

instance AWSPager ListDomains where
    next rq rs = (\x -> rq { _ldiNextPageToken = Just x })
        <$> (_dddddsNextPageToken rs)
