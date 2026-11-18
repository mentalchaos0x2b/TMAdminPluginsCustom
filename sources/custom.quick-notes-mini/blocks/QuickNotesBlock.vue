<script setup lang="ts">
import { ref, watch, onMounted } from "vue";
import { defineBlock, usePluginStore, useMessage } from "@tmadmin/sdk";
import { NInput, NButton, NCard, NSpace } from "naive-ui";

defineBlock({
  title: "Быстрые заметки",
  description: "Оперативные заметки с сохранением состояния",
  icon: "CreateOutline",
  defaultSize: { w: 8, h: 5 },
  minSize: { w: 4, h: 3 },
});

const store = usePluginStore();
const message = useMessage();
const noteText = ref("");

onMounted(async () => {
  const saved = await store.get<string>("quick_note");
  if (saved) {
    noteText.value = saved;
  }
});

async function handleSave() {
  await store.set("quick_note", noteText.value);
  message.success("Заметка сохранена в локальное хранилище плагина");
}
</script>

<template>
  <div style="padding: 12px; display: flex; flex-direction: column; height: 100%; gap: 8px;">
    <n-input
      v-model:value="noteText"
      type="textarea"
      placeholder="Введите оперативную заметку здесь..."
      style="flex: 1; resize: none;"
    />
    <n-space justify="end">
      <n-button size="small" type="primary" @click="handleSave">Сохранить</n-button>
    </n-space>
  </div>
</template>
