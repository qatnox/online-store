// app/javascript/packs/application.js

import { Turbo } from "@hotwired/turbo-rails"
import { createConsumer } from "@rails/actioncable"

// Create a consumer for ActionCable
const cable = createConsumer("/cable")

const chatChannel = cable.subscriptions.create("ChatChannel", {
    connected() {
        console.log("Connected to ChatChannel")
    },

    disconnected() {
        console.log("Disconnected from ChatChannel")
    },

    received(data) {
        console.log("Received data:", data)
        // Update the UI with the received message
        const messagesContainer = document.querySelector("#messages")
        if (messagesContainer) {
            messagesContainer.insertAdjacentHTML("beforeend", `<p>${data.message}</p>`)
        }
    },

    sendMessage(message) {
        this.perform("send_message", { content: message })
    }
})

document.addEventListener("DOMContentLoaded", () => {
    const messageForm = document.querySelector("#message-form")
    if (messageForm) {
        messageForm.addEventListener("submit", (event) => {
            event.preventDefault()
            const messageInput = document.querySelector("#message-input")
            const message = messageInput.value
            chatChannel.sendMessage(message)
            messageInput.value = ""
        })
    }
})
