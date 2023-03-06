# sean's [web-greeter](https://github.com/JezerM/web-greeter) theme

![](demo.png)

## Setup

1. Install dependencies

```
npm install
```

2. Build theme

```
npm run build
```

3. Add user avatar

```
sudo cp <path-to-image> /var/lib/AccountsService/icons/<username>
```

## General tips

1. To attain the same settings as the unixporn post, you'll need to disable the
   splash text and enable rounded avatars.

2. I have multiple desktop environments and want to select one at login
   - Uncomment line 36 in `src/views/Login.vue` to turn on DE selection. I only
     use Xfce so I removed this functionality since it was unnecessary for me.
