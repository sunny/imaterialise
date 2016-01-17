Ruby gem to access i.materialise's API
======================================

Configuration
-------------

```rb
Imaterialise.configure do |c|
  c.tool_id = "YOUR-TOOL-ID-HERE"

  # Use the sandbox environment during development
  c.sandbox = true
end
```

Usage
-----

### 3D Print Lab Connection

```rb
connection = Imaterialise::Connection.new(file_url: "/path/to/example.stl",
                                          currency: "eur")
connection.upload
connection.url # => "http://i.materialise.com/UploadRouter?modelID=1234-5678-1…"
```

You can redirect your users to the given URL.


Install
-------

Add the following line to your Gemfile if you are using the `bundler` gem:

```rb
gem "imaterialise"
```


Development
-----------

To launch specs:

```sh
$ rake
```


License
-------

Created by Sunny Ripert for [Cults.](https://cults3d.com),
licensed under the MIT License.


See also
--------

- https://i.materialise.com/api/
