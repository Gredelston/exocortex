Google Cloud requires to write a privacy policy in order to publish my app, because I'm using OAuth to collect user data.

# What data I'm storing
I don't intend to store any user data, except for maybe your Google user ID. Really all I care about is authenticating you so that you can access my API (and therefore my database).

# How your user data is stored
Your user data will be stored, unencrypted, on a Google Cloud MySQL database. I might store some insensitive user data, like your user ID, locally on your machine. There's a chance that someday I'll download a snapshot of my Cloud SQL database onto my machine.
Your password will always be encrypted, both in transit and at rest. That's just good sense.

# Will I ever sell, trade, or give away your user info?
Hell no!

# Will I ever use your user data for marketing?
Hell no!

# Is there something I'm forgetting?
Open a ticket on github.com/gredelston/exocortex.
