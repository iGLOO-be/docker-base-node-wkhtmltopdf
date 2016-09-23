
const path = require('path')
const fs = require('fs')
const wkhtmltopdf = require('wkhtmltopdf')

const out = path.join(__dirname, 'test.pdf')

wkhtmltopdf('Hello')
  .pipe(fs.createWriteStream(out))
  .on('finish', () => {
    fs.statSync(out)
    console.log('Test successed')
  })
