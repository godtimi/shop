export default {
    init: function () {
        const AK = 'bmvg8yeOopwOB4aHl5uvx52rgIa3VrPO';  //你的AK
        const BMap_URL = "https://api.map.baidu.com/api?v=2.0&ak=" + AK + "&s=1&callback=onBMapCallback";
        return new Promise((resolve, reject) => {
            // 如果已加载直接返回
            if (typeof BMap !== 'undefined') {
                resolve(BMap);
                return true;
            }
            // 百度地图异步加载回调处理
            window.onBMapCallback = function () {
                resolve(BMap);
            };
            let getCurrentCityName = function () {
                return new Promise(function (resolve, reject) {
                    let myCity = new BMap.LocalCity()
                    myCity.get(function (result) {
                        resolve(result.name)
                    })
                })
            }
            // 插入script脚本
            let scriptNode = document.createElement('script');
            scriptNode.setAttribute('src', BMap_URL);
            scriptNode.setAttribute('type', 'text/javascript');
            document.body.appendChild(scriptNode);
        });
    }
}