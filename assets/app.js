import { registerReactControllerComponents } from '@symfony/ux-react';
/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// IMPORT STYLE
import './styles/app.scss';

// IMPORT BOOTSTRAP
import 'bootstrap';
import bsCustomFileInput from 'bs-custom-file-input';
bsCustomFileInput.init();

// IMPORT STIMULUS
import './bootstrap.js';

registerReactControllerComponents(require.context('./react/controllers', true, /\.(j|t)sx?$/));