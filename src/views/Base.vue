<template>
  <div class="base">
    <div
      class="bg"
      :class="{ blured: isBlured() }"
      :style="{ 'background-image': 'url(' + background + ')' }"
    ></div>

    <transition name="fade">
      <router-view />
    </transition>
  </div>
</template>

<script>
import { background } from '../themer';

export default {
  name: 'l-base',

  data() {
    return {
      background,
    };
  },
  methods: {
    isBlured() {
      let name = this.$router.currentRoute.name;
      return name === 'login' || name === 'select';
    },
  },
};
</script>

<style lang="scss">
@import '../theme';

.bg {
  background-size: cover;
  position: absolute;
  left: 0;
  right: 0;

  display: block;
  width: 100%;
  height: 100vh;

  z-index: -1;

  filter: blur(0px);
  transition: filter 500ms ease-in-out;

  color: $secondary-color;
}

.blured {
  filter: blur(10px);
}
</style>
