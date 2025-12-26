// Helper script for Color Picker (Iro.js)
// This script creates the modal dynamically and handles the color picking logic.

var colorPickerIro = null;

document.addEventListener("DOMContentLoaded", function () {
   // Create and inject the modal HTML structure styles
   const modalHTML = `
    <dialog id="color-modal-window" style="background: #252525; padding: 0; border-radius: 16px; border: 1px solid #444; box-shadow: 0 20px 40px rgba(0,0,0,0.6); overflow: hidden; color: #eee; font-family: sans-serif; z-index: 2000; left:50%; top:10px; transform: translate(-50%, 0);     max-width: none; width: min(500px, 96vw); overflow: auto;">
        <div style="padding: 20px; display: flex; flex-direction: column; align-items: center;">
            <h3 style="margin: 0 0 20px 0; font-size: 18px; font-weight: 500; color: white;">Pick a Color</h3>
            <div id="iro-color-picker"></div>
            <div style="margin-top: 25px; display: flex; gap: 15px; width: 100%; justify-content: center;">
                <button type="button" id="color-cancel-btn" style="padding: 10px 24px; border-radius: 8px; border: 1px solid #555; background: transparent; color: #aaa; cursor: pointer; flex: 1; max-width: 100px;">Cancel</button>
                <button type="button" id="color-select-btn" style="padding: 10px 24px; border-radius: 8px; border: none; background: #30c731; color: white; font-weight: 600; cursor: pointer; flex: 1; max-width: 100px; box-shadow: 0 4px 10px rgba(48, 199, 49, 0.3);">Select</button>
            </div>
        </div>
    </dialog>
    `;

   // Only append if it doesn't exist
   if (!document.getElementById('color-modal-window')) {
      const div = document.createElement('div');
      div.innerHTML = modalHTML;
      document.body.appendChild(div.firstElementChild);
   }

   // Bind events
   document.getElementById('color-cancel-btn').addEventListener('click', closeColorModal);
   document.getElementById('color-select-btn').addEventListener('click', applyColor);
});



function openColorModal() {
   const hiddenInput = document.getElementById('color-picker');
   const colorModal = document.getElementById('color-modal-window');

   if (!colorPickerIro) {
      // Initialize iro.js
      colorPickerIro = new iro.ColorPicker("#iro-color-picker", {
         width: 220,
         color: hiddenInput.value || "#000000",
         borderWidth: 2,
         borderColor: "#fff",
         layout: [
            {
               component: iro.ui.Wheel,
               options: {}
            },
            {
               component: iro.ui.Slider,
               options: {
                  sliderType: 'hue'
               }
            },
            {
               component: iro.ui.Slider,
               options: {
                  sliderType: 'saturation'
               }
            },
            {
               component: iro.ui.Slider,
               options: {
                  sliderType: 'value'
               }
            },
            {
               component: iro.ui.Slider,
               options: {
                  sliderType: 'alpha'
               }
            }
         ]
      });
   } else {
      // Update color from input
      colorPickerIro.color.hex8String = hiddenInput.value;
   }

   // Use requestAnimationFrame to sync with rendering pipeline and reduce Android frame errors
   requestAnimationFrame(() => {
      colorModal.showModal();
   });

   // Close on backdrop click (optional, but nice)
   colorModal.addEventListener('click', (e) => {
      const rect = colorModal.getBoundingClientRect();
      if (e.clientX < rect.left || e.clientX > rect.right ||
         e.clientY < rect.top || e.clientY > rect.bottom) {
         closeColorModal();
      }
   });
}

function closeColorModal() {
   document.getElementById('color-modal-window').close();
}

function applyColor() {
   const hiddenInput = document.getElementById('color-picker');
   const colorTrigger = document.getElementById('custom-color-trigger');
   let color = colorPickerIro.color.hex8String;

   // logic: if transparency is full (FF), strip it to 6 chars
   if (color.toLowerCase().endsWith('ff')) {
      color = color.substring(0, 7);
   }

   hiddenInput.value = color;

   if (colorTrigger) {
      colorTrigger.style.backgroundColor = color;
   }

   // Dispatch input event for listeners (like in paint.html)
   const event = new Event('input', {
      bubbles: true,
      cancelable: true,
   });
   hiddenInput.dispatchEvent(event);

   closeColorModal();
}
