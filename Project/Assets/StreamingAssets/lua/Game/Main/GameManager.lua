require "Game/Control/CubeControl"
require "Game/Control/PlayControl"

function GameManager()
	
	local this = {};
	
	local playControl = nil;				--玩家自身的角色控制对象

	local function OnLoadGameObjectFinish(gameObject )
		
		local go = UnityEngine.GameObject.Instantiate(gameObject[0]);
		
		local imageObject = UnityEngine.GameObject.Find("Image");
		LuaFramework.Util.Log("OnLoadGameObjectFinish")
		
		local cubeControl = CubeControl(this);

		playControl = PlayControl();
		
	end
	
	local function createEmptyGameObject()
		
		LuaFramework.Util.Log("addGameObject")
		local go = UnityEngine.GameObject ('go')
		go.transform.position = Vector3.one
		
	end
	
	local function Update()
		--LuaFramework.Util.Log("GameManager.Update")

	end
	
	function init()
		
		--MyTestLuaFun.Log();
		
		createEmptyGameObject();			
		
		LuaFramework.LuaHelper.GetResManager():LoadPrefab("resources" , {"TTT"} , OnLoadGameObjectFinish)			--¼ÓÔØ¶ÔÓ¦µÄ

		UpdateBeat:Add(Update, self)

		local canvasObject = UnityEngine.GameObject.Find("Canvas")

		local mapObject = UnityEngine.GameObject ("map");
		mapObject:AddComponent(typeof(UnityEngine.UI.Image))
		mapObject.transform:SetParent(canvasObject.transform)
		mapObject.transform.position = Vector3.New(100,100,0);

		local mapImageObject = mapObject:GetComponent("Image")
		mapImageObject.sprite = My.Tools.CreateSprite("Sprites/ht_ico")



	end
	
	init();


	this.getPlayControl = function()	return playControl 	end
	
	return this;
	
end