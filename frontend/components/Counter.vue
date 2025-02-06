<script setup>
import { ref } from 'vue'

defineProps({
  msg: String,
})

const count = ref(0)
</script>

<template>
  <div class="card">
    <button class="btn btn-primary max-w-[200px]" type="button" @click="count++">count is {{ count }}</button>
  </div>
</template>