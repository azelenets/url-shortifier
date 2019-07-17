const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    'window.jQuery': 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default']
  })
);

module.exports = environment
