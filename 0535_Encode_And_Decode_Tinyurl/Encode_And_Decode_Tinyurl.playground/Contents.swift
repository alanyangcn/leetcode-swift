import UIKit
/*
 * problem url: https://leetcode.com/problems/encode-and-decode-tinyurl
 */

/*
 TinyURL is a URL shortening service where you enter a URL such as https://leetcode.com/problems/design-tinyurl and it returns a short URL such as http://tinyurl.com/4e9iAk.
 
 Design the encode and decode methods for the TinyURL service. There is no restriction on how your encode/decode algorithm should work. You just need to ensure that a URL can be encoded to a tiny URL and the tiny URL can be decoded to the original URL.
 */

let dict = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

var urls = [String: String]()

let shortUrlCount = 6

func encode(longUrl: String) -> String {
    
    var result = ""
    
    var i = 0
    
    while i < shortUrlCount {
        
        result = result + String(dict.randomElement()!)
        
        i += 1
    }
    
    urls[result] = longUrl
    return result
}

func decode(shortUrl: String) -> String? {

    return urls[shortUrl]
}

let url = "https://leetcode.com/problems/design-tinyurl"

let shortUrl = encode(longUrl: url)

let longUrl = decode(shortUrl: shortUrl)


print(url)
print(shortUrl)
print(longUrl ?? "")


