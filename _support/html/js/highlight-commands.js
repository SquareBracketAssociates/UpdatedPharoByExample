/* Extends highligh.js for shell commands alternating with program output..
 * Cmmands are single line and must be marked with a prompt sign (a dollar
 * sign).
 *
 * Disclaimer: this is implemented as a monkey-patch over highlight.pack.js so
 * it uses the short illegible key names (c, cN…). See their build tool:
 * https://github.com/isagalaev/highlight.js/blob/master/tools/build.py
 */
hljs.LANGUAGES.shellcommands = (function (it) {
    "use strict";
    var prompt_re = /^\$\ /;
    return {
        c: [{
            cN: "prompt",
            b: prompt_re,
            starts: { e: /$/, sL: "bash" }
        }, { cN: "output", b: /^[^$]/, e: prompt_re, rE: true }]
    };
}(hljs));
