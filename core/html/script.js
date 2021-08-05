window.addEventListener('message', function (event) {
	switch (event.data.action) {
        case 'updateStatusHud':
            $("body").css("display", event.data.show ? "block" : "none");
            $("#boxSetHealth").css("width", event.data.health + "%");
            if (event.data.armour < 1){
                $("#varArmour").css("display","none");
            } else{
                $("#varArmour").css("display","block");
                if (event.data.armour === 98){
                    $("#boxSetArmour").css("width", 100 + "%");
                }else{
                    $("#boxSetArmour").css("width", event.data.armour + "%");
                }

            }


        }
    });