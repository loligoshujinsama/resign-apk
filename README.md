# resign-apk
<p>VBScript to automatically resign applications.</p>
<p>Why is resigining neccessary?</p>
<p>For proxies to intercept data, some non-RASP binaries have SSL pinning enabled on their applications. This resigner gracefully resigns the application to allow third-party certificates to be applied and ultimately allowing proxies to intercept traffic between the user and the server.</p>

<p>How to use?</p>
<p>Paste the non-RASP binary you wish to resign into the same folder as 'recompilation' and run resign.vbs</p>

Note: Windows Defender might block the .bat file. Temporarily disable them please :) Work is not harmful, for convenience only.
