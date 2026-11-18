<script setup lang="ts">
import { ref } from "vue";
import { defineBlock, useMessage } from "@tmadmin/sdk";
import { NButton, NCard, NText } from "naive-ui";

defineBlock({
  title: "Приветствие Custom",
  description: "Демонстрационный блок кастомного репозитория",
  icon: "AppsOutline",
  defaultSize: { w: 8, h: 4 },
  minSize: { w: 4, h: 2 },
});

const message = useMessage();
const clickCount = ref(0);

function handleClick() {
  clickCount.value++;
  message.success(`Клик по кастомному блоку! Всего: ${clickCount.value}`);
}
</script>

<template>
  <div style="padding: 16px; display: flex; flex-direction: column; gap: 12px; height: 100%; justify-content: center; align-items: center;">
    <n-card size="small" title="Custom Plugin Sandbox">
      <n-text>Этот плагин загружен из кастомного репозитория TMAdminPluginsCustom.</n-text>
      <div style="margin-top: 12px;">
        <n-button type="primary" size="small" @click="handleClick">
          Нажми меня ({{ clickCount }})
        </n-button>
      </div>
    </n-card>
  </div>
</template>
