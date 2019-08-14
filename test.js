/**
 * 公共函数模块
 */
const mCrypto = require('crypto');


function getMd5(str) {
    let md5sum = mCrypto.createHash('md5');
    md5sum.update(str);

    return md5sum.digest('hex');
}

console.log('123456', getMd5('123456'));
console.log('123456', getMd5("123456"));

console.log('sss', "undefined" == typeof body ? getMd5('123456') : getMd5(body));
