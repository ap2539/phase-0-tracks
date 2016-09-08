## What are some common HTTP status codes?
* 100 - Continue - The client has sent the initial request headers and the server is expecting the body. Response 100 is sent to inform the client to send the request body
* 200 - OK - Can be presented differently. When responding to a get request the response will contain the requested information. When sent as a post request the response will include the results of the action
* 204 - No Content - This status represents a successful put. An action was triggered by the client which resulted in no content needing to be returned.
* 206 - Partial Content - When the client requests a range of data this response is sent to signify that the range of data requested has been completed. This is useful when sending pieces of video or audio so they whole file does not need to be sent at once 
* 302 - The URI the client has reached to has been moved temporarily and can still be used.
* 304 - Used with caching, telling the client that the response has not been changed and the cached version can still be used
* 307 - Same as 302 response with the exception that the client cannot change the method of request.
* 403 - Forbidden because the client does not have access to the requested resource
* 404 - Requested resource cannot be found

## What is the difference between a GET and a POST request? When might each be used?
* GET method requests data from a specific source. This type of request can be bookmarked because the query string can be part of the URL. Therfore the URL would also become part of the browser history and can be cached. This also means that this method has little security.
* POST methodis the opposite of teh get method. It cannot be book marked because the data is not sent as part of the URL therefore it cannot cached either. This makes it much more secure since the data will not be displayed as part of teh URL

## What is cookie? How does it related to HTTP requests
* A cookie is essentially used to identify an individual client. Prior to cookies a web server had no way of knowing if a requests came from the same client. The cookie then serves as a token allowing the web server to know the state of the client. In most cases secure cookies allow the web server to know that the client has been authenticated and is allowed to make requests to secured information.