function fn() {
    karate.log('env system property was:', karate.properties['env'])
    let protocol = 'http'
    let config = {}
    config.env = karate.properties['env']
    switch(config.env) {
        case 'dev':
            config.baseUrl =  protocol + '://0.0.0.0:8900'
            break;
        case 'mock':
            config.baseUrl =  protocol + '://127.0.0.1:'
            break;
        default:
            karate.fail(`Env is ${env}. Please set it! Proper values are mock, dev`)
    }
    karate.configure('connectTimeout', 9000)
    karate.configure('readTimeout', 9000)
    return config
}