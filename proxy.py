import flask
import subprocess

proxy = flask.Flask(__name__)

@proxy.route("/init", methods=[ "POST" ])
def init():
    return flask.jsonify(ok=True)

@proxy.route("/run", methods=[ "POST" ])
def run():
    msg = flask.request.get_json(force=True, silent=True)

    if not msg or not isinstance(msg, dict):
        r = flask.jsonify({ "error": "Invalid payload." })
        r.status_code = 400
        return r
    else:
        input_string = msg.get("value", {}).get("input", {})

        with open("/root/dos/INPUT.STR", "w") as fp:
            fp.write("\"%s\"\n" % input_string)

        subprocess.call([
            "dosbox", "./PRINT.EXE", "-c", "C:\\QBASIC.EXE /run C:\\MORSE.BAS > C:\\LOG.TXT", "-exit"
        ], cwd="/root/dos")

        output = "???"

        try:
            with open("/root/dos/LOG.TXT", "r") as fp:
                output = fp.read().strip()
        except e:
            pass

        return flask.jsonify(input=input_string, output=output)

if __name__ == "__main__":
    proxy.run(host='0.0.0.0', port=8080)
