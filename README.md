# quote-api

[![wakatime](https://wakatime.com/badge/github/LyoSU/quote-api.svg)](https://wakatime.com/badge/github/LyoSU/quote-api)

API for generating Telegram quotes

## Methods
##### Creating a quote
```http
POST /generate
```

Example JSON request:
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
      "media": {
        "url": "https://via.placeholder.com/1000"
      },
      "avatar": true,
      "from": {
        "id": 1,
        "name": "Mike",
        "photo": {
          "url": "https://via.placeholder.com/100"
        }
      },
      "text": "Hey",
      "replyMessage": {}
    }
  ]
}
```

Parameters:
|  Field | Type |  Description  |
| :------------ | :------------ | :------------ |
|  type | string | The type of output image. It can be: quote, image, null |
|  backgroundColor | string | The background color of the quote. It can be a hex code, name, or "random" for a random color |
|  messages | array |An array of messages |
| width | number | The maximum width |
| height | number | The maximum height|
| scale | number | The scale |

Example response:

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
