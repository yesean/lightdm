<template>
  <div id="intro">
    <transition name="logo-fade">
      <div id="content" v-if="show">
        <img
          v-if="state === 'initial'"
          id="logo"
          src="../assets/images/os.png"
        />
        <p v-else id="power-text">
          <img
            id="power-icon"
            :src="require('../assets/images/' + state + '.svg')"
          />
          {{ text }}
        </p>
      </div>
    </transition>
  </div>
</template>

<script>
import { trans } from '@/translations';
import { settings } from '@/settings';

export default {
  name: 'intro',

  mounted() {
    if (settings.disableIntro && this.state === 'initial') {
      this.$router
        .push(settings.disableSplash ? '/base/login' : '/base/splash')
        .catch(() => {});
      return;
    }

    if (this.state === 'login') {
      return;
    }

    this.show = true;

    if (this.state === 'initial') {
      setTimeout(() => {
        this.show = false;
        this.$router
          .push(
            settings.first
              ? '/setup'
              : settings.disableSplash
              ? '/base/login'
              : '/base/splash',
          )
          .catch(() => {});
      }, 2000);
    }
  },

  data() {
    return {
      show: false,
      state: this.$route.params.state,
      text: trans(this.$route.params.state),
    };
  },
};
</script>

<style lang="scss" scoped>
@import '../theme';

#intro {
  background-color: $outer-background;
  display: flex;
  align-items: center;
  text-align: center;
}

#content {
  margin-left: auto;
  margin-right: auto;
}

#logo {
  height: 125px;
}

#power-text {
  font-family: 'Inter';
  font-weight: normal;
  color: $outer-foreground;
  font-size: 16px;
}

.logo-fade-enter-active,
.logo-fade-leave-active {
  transition: opacity 1s;
}

.logo-fade-enter,
.logo-fade-leave-to {
  opacity: 0;
}

#power-icon {
  width: 24px;

  margin-bottom: -5px;
  margin-right: 4px;
}
</style>
