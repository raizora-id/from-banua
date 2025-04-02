// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

import { addDynamicIconSelectors } from '@iconify/tailwind';
import fs from 'fs';
import path from 'path';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./js/**/*.js",
    "../lib/frombanua_web.ex",
    "../lib/frombanua_web/**/*.*ex"
  ],
  theme: {
    extend: {
      colors: {
        brand: "#FD4F00",
        primary: {
          50: '#f0fdfa',
          100: '#ccfbf1',
          200: '#99f6e4',
          300: '#5eead4',
          400: '#2dd4bf',
          500: '#14b8a6',
          600: '#0d9488',
          700: '#0f766e',
          800: '#115e59',
          900: '#134e4a',
          950: '#042f2e',
        },
      }
    },
  },
  plugins: [
    forms,
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    ({addVariant}) => {
      addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"]);
      addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"]);
      addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"]);
    },

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        try {
          fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
            let name = path.basename(file, ".svg") + suffix
            values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
          })
        } catch (error) {
          console.warn(`Warning: Icon directory not found: ${path.join(iconsDir, dir)}`)
        }
      })
      matchComponents({
        "hero": ({name, fullPath}) => {
          try {
            let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
            let size = theme("spacing.6")
            if (name.endsWith("-mini")) {
              size = theme("spacing.5")
            } else if (name.endsWith("-micro")) {
              size = theme("spacing.4")
            }
            return {
              [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              "-webkit-mask": `var(--hero-${name})`,
              "mask": `var(--hero-${name})`,
              "mask-repeat": "no-repeat",
              "background-color": "currentColor",
              "vertical-align": "middle",
              "display": "inline-block",
              "width": size,
              "height": size
            }
          } catch (error) {
            console.warn(`Warning: Could not read icon file: ${fullPath}`)
            return {}
          }
        }
      }, {values})
    }
  ]
}
