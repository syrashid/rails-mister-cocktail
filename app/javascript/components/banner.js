import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Grab a seat ....we're pouring"],
    typeSpeed: 75,
    loop: false
  });
}


export { loadDynamicBannerText };
