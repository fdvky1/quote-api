# quote-api

[![wakatime](https://wakatime.com/badge/github/LyoSU/quote-api.svg)](https://wakatime.com/badge/github/LyoSU/quote-api)

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/0K26m0)

API for generating Telegram quotes

## Methods
##### Create a Quote
```http
POST /generate
```

JSON request example:
```json
{
  "type": "quote",
  "format": "png",
  "backgroundColor": "#1b1429",
  "width": 512,
  "height": 768,
  "scale": 2,
  "messages": [
    {
      "entities": [],
      "chatId": 66478514,
      "avatar": true,
      "from": {
        "id": 66478514,
        "first_name": "Yuri 💜",
        "last_name": "Ly",
        "username": "LyoSU",
        "language_code": "ru",
        "title": "Yuri 💜 Ly",
        "photo": {
          "small_file_id": "AQADAgADCKoxG7Jh9gMACBbSEZguAAMCAAOyYfYDAATieVimvJOu7M43BQABHgQ",
          "small_file_unique_id": "AQADFtIRmC4AA843BQAB",
          "big_file_id": "AQADAgADCKoxG7Jh9gMACBbSEZguAAMDAAOyYfYDAATieVimvJOu7NA3BQABHgQ",
          "big_file_unique_id": "AQADFtIRmC4AA9A3BQAB"
        },
        "type": "private",
        "name": "Yuri 💜 Ly"
      },
      "text": "I love you 💜",
      "replyMessage": {}
    }
  ]
}
```

Media:
```json
{
  "type": "quote",
  "format": "png",
  "backgroundColor": "#1b1429",
  "width": 512,
  "height": 768,
  "scale": 2,
  "messages": [
    {
      "media": [
        {
          "file_id": "CAACAgIAAxkBAAIyH2AAAUcJoPJqv4uOPabtiSR3judSnQACaQEAAiI3jgQe29BUaNTqrx4E",
          "file_size": 22811,
          "height": 512,
          "width": 512
        }
      ],
      "mediaType": "sticker",
      "chatId": 66478514,
      "avatar": true,
      "from": {
        "id": 66478514,
        "first_name": "Yuri 💜",
        "last_name": "Ly",
        "username": "LyoSU",
        "language_code": "ru",
        "title": "Yuri 💜 Ly",
        "photo": {
          "small_file_id": "AQADAgADCKoxG7Jh9gMACBbSEZguAAMCAAOyYfYDAATieVimvJOu7M43BQABHgQ",
          "small_file_unique_id": "AQADFtIRmC4AA843BQAB",
          "big_file_id": "AQADAgADCKoxG7Jh9gMACBbSEZguAAMDAAOyYfYDAATieVimvJOu7NA3BQABHgQ",
          "big_file_unique_id": "AQADFtIRmC4AA9A3BQAB"
        },
        "type": "private",
        "name": "Yuri 💜 Ly"
      },
      "replyMessage": {}
    }
  ]
}
```

Without Telegram
```js
{
  "type": "quote",
  "format": "png",
  "backgroundColor": "#1b1429",
  "width": 512,
  "height": 768,
  "scale": 2,
  "messages": [
    {
      "entities": [],
      "media": {
        "url": "https://via.placeholder.com/1000"
        //"base64": "base64 image" // use this if you want to use base64
      },
      "avatar": true,
      "from": {
        "id": 1,
        "name": "Mike",
        "photo": {
          "url": "https://via.placeholder.com/100"
          //"createImageLatters": true // use this if you don't have photo, it will create image of latters
        }
      },
      "text": "Hey",
      "replyMessage": {}
    }
  ]
}
```

Options:
|  Field | Type |  Description  |
| :------------ | :------------ | :------------ |
|  type | string | The type of the output image. Maybe: quote, image, null |
|  backgroundColor | string | Quote background color. Can be Hex, name or random for random color |
|  messages | array | Array of messages |
| width | number | Max Width |
| height | number | Max Height |
| scale | number | Scale |
| isWaSticker | boolean | resize output to WhatsApp sticker(512*512) |

Response example:

```json
{
  "ok": true,
  "result": {
    "image": "base64 image",
    "type": "quote",
    "width": 512,
    "height": 359
  }
}

```

## Request examples:
> JavaScript
```js
const axios = require('axios')
const fs = require('fs')

const text = "Hello World"
const username = "Alι_Aryαɴ"
const avatar = "https://telegra.ph/file/59952c903fdfb10b752b3.jpg"

const json = {
  "type": "quote",
  "format": "png",
  "backgroundColor": "#FFFFFF",
  "width": 512,
  "height": 768,
  "scale": 2,
  "messages": [
    {
      "entities": [],
      "avatar": true,
      "from": {
        "id": 1,
        "name": username,
        "photo": {
          "url": avatar
        }
      },
      "text": text,
      "replyMessage": {}
    }
  ]
};
        const response = axios.post('https://bot.lyo.su/quote/generate', json, {
        headers: {'Content-Type': 'application/json'}
}).then(res => {
    const buffer = Buffer.from(res.data.result.image, 'base64')
       fs.writeFile('Quotly.png', buffer, (err) => {
      if (err) throw err;
    })
});
```

> Python
```py
import requests
import base64

text = "Hello World"
username = "Alι_Aryαɴ" 
avatar = "https://telegra.ph/file/59952c903fdfb10b752b3.jpg"

json = {
  "type": "quote",
  "format": "webp",
  "backgroundColor": "#FFFFFF",
  "width": 512,
  "height": 768,
  "scale": 2,
  "messages": [
    {
      "entities": [],
      "avatar": True,
      "from": {
        "id": 1,
        "name": username,
        "photo": {
          "url": avatar
        }
      },
      "text": text,
      "replyMessage": {}
    }
  ]
}

response = requests.post('https://bot.lyo.su/quote/generate', json=json).json()
buffer = base64.b64decode(response['result']['image'].encode('utf-8'))
open('Quotly.png', 'wb').write(buffer)
print('Quotly.png')
```
### Response

![Quotly.png](assets/Quotly.png)